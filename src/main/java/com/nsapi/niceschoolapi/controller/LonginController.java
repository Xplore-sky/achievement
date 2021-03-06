package com.nsapi.niceschoolapi.controller;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.nsapi.niceschoolapi.entity.ShowMenuVo;
import com.nsapi.niceschoolapi.service.MenuService;
import com.nsapi.niceschoolapi.service.UserService;
import com.nsapi.niceschoolapi.common.annotation.SysLog;
import com.nsapi.niceschoolapi.common.config.MySysUser;
import com.nsapi.niceschoolapi.common.exception.UserTypeAccountException;
import com.nsapi.niceschoolapi.common.realm.AuthRealm;
import com.nsapi.niceschoolapi.common.util.Constants;
import com.nsapi.niceschoolapi.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

@Controller
public class LonginController {

    private final static Logger LOGGER = LoggerFactory.getLogger(LonginController.class);

    public final static String LOGIN_TYPE = "loginType";

    @Autowired
    @Qualifier("captchaProducer")
    DefaultKaptcha captchaProducer;

    @Autowired
    UserService userService;

    @Autowired
    MenuService menuService;

    public enum LoginTypeEnum {
        PAGE,ADMIN;
    }

//    @RequestMapping(value = "")
//    public String welcome() {
//        return "redirect:admin";
//    }

    @RequestMapping(value = {"admin","admin/index"})
    public String adminIndex(RedirectAttributes attributes, ModelMap map) {
        Subject s = SecurityUtils.getSubject();
        attributes.addFlashAttribute(LOGIN_TYPE, LoginTypeEnum.ADMIN);
        if(s.isAuthenticated()) {
            return "redirect:index";
        }
        return "redirect:toLogin";
    }

    @RequestMapping(value = "toLogin")
    public String adminToLogin(HttpSession session, @ModelAttribute(LOGIN_TYPE) String loginType) {
        if(StringUtils.isBlank(loginType)) {
            LoginTypeEnum attribute = (LoginTypeEnum) session.getAttribute(LOGIN_TYPE);
            loginType = attribute == null ? loginType : attribute.name();
        }

        if(LoginTypeEnum.ADMIN.name().equals(loginType)) {
            session.setAttribute(LOGIN_TYPE,LoginTypeEnum.ADMIN);
            return "admin/login";
        }else {
            session.setAttribute(LOGIN_TYPE,LoginTypeEnum.PAGE);
            return "login";
        }
    }

    @RequestMapping(value = "index")
    public String index(HttpSession session, @ModelAttribute(LOGIN_TYPE) String loginType) {
        if(StringUtils.isBlank(loginType)) {
            LoginTypeEnum attribute = (LoginTypeEnum) session.getAttribute(LOGIN_TYPE);
            loginType = attribute == null ? loginType : attribute.name();
        }
        if(LoginTypeEnum.ADMIN.name().equals(loginType)) {
            AuthRealm.ShiroUser principal = (AuthRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
            session.setAttribute("icon",StringUtils.isBlank(principal.getIcon()) ? "/static/admin/img/face.jpg" : principal.getIcon());
            return "admin/index";
        }else {
            return "admin/index";
        }

    }

    @RequestMapping("/getCaptcha")
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //?????????????????????
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        String verifyCode = captchaProducer.createText();
        //??????????????????HttpSession??????
        request.getSession().setAttribute(Constants.VALIDATE_CODE, verifyCode);
        LOGGER.info("???????????????????????????[" + verifyCode + "],????????????HttpSession???");
        //?????????????????????????????????JPEG??????
        response.setContentType("image/jpeg");
        BufferedImage bufferedImage = captchaProducer.createImage(verifyCode);
        //???????????????
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
    }

    @PostMapping("admin/login")
    @SysLog("????????????")
    @ResponseBody
    public ResponseEntity adminLogin(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        String code = request.getParameter("code");
        String driver = request.getParameter("driver");
        String errorMsg = null;
        //??????????????????
        if(StringUtils.isBlank(driver)){
            //????????????
            if(StringUtils.isBlank(username) || StringUtils.isBlank(password)){
                return ResponseEntity.failure("?????????????????????????????????");
            }else if(StringUtils.isBlank(code)){
                return ResponseEntity.failure("?????????????????????");
            }
            HttpSession session = request.getSession();
            if(session == null){
                return ResponseEntity.failure("session??????");
            }
            String trueCode = (String)session.getAttribute(Constants.VALIDATE_CODE);
            if(StringUtils.isBlank(trueCode)){
                return ResponseEntity.failure("???????????????");
            }
            if(StringUtils.isBlank(code) || !trueCode.toLowerCase().equals(code.toLowerCase())){
                return ResponseEntity.failure("???????????????");
            }else {
                Subject user = SecurityUtils.getSubject();
                UsernamePasswordToken token = new UsernamePasswordToken(username,password,Boolean.valueOf(rememberMe));
                try {
                    user.login(token);
                }catch (IncorrectCredentialsException e) {
                    errorMsg = "?????????????????????!";
                }catch (UnknownAccountException e) {
                    errorMsg = "???????????????!";
                }catch (LockedAccountException e) {
                    errorMsg = "??????????????????!";
                }catch (UserTypeAccountException e) {
                    errorMsg = "????????????????????????!";
                }
                if(StringUtils.isBlank(errorMsg)) {
                    ResponseEntity responseEntity = new ResponseEntity();
                    responseEntity.setSuccess(Boolean.TRUE);
                    responseEntity.setAny("url","index");
                    return responseEntity;
                }else {
                    return ResponseEntity.failure(errorMsg);
                }
            }
        }else{
            //????????????APP??????
            if(StringUtils.isBlank(username) || StringUtils.isBlank(password)){
                return ResponseEntity.failure("?????????????????????????????????");
            }
            Subject user = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username,password,Boolean.valueOf(rememberMe));
            try {
                user.login(token);
            }catch (IncorrectCredentialsException e) {
                errorMsg = "????????????????????????!";
            }catch (UnknownAccountException e) {
                errorMsg = "???????????????!";
            }catch (LockedAccountException e) {
                errorMsg = "??????????????????!";
            }catch (UserTypeAccountException e) {
                errorMsg = "????????????????????????!";
            }
            if(StringUtils.isBlank(errorMsg)) {
                ResponseEntity responseEntity = new ResponseEntity();
                responseEntity.setSuccess(Boolean.TRUE);
                responseEntity.setAny("url","index");
                return responseEntity;
            }else {
                return ResponseEntity.failure(errorMsg);
            }
        }





    }

    @RequestMapping("admin/main")
    public String main(ModelMap map){
        return "admin/main";
    }

    /***
     * ????????????????????????????????????
     * @return
     */
    @RequestMapping("/admin/user/getUserMenu")
    @ResponseBody
    public List<ShowMenuVo> getUserMenu(){
        String userId = MySysUser.id();
        List<ShowMenuVo> list = menuService.getShowMenuByUser(userId);
        return list;
    }

    @RequestMapping("systemLogout")
    @SysLog("????????????")
    public String logOut(){
        SecurityUtils.getSubject().logout();
        return "redirect:home";
    }

}

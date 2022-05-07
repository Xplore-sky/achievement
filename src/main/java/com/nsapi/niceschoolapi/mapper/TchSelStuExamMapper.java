package com.nsapi.niceschoolapi.mapper;

import com.nsapi.niceschoolapi.entity.TchSelStuExamVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TchSelStuExamMapper {
    //查询教师监考班级
    List<Map> selTchClass(String tid);
    //教师查询学生成绩
    List<Map> tchSelStuExam(TchSelStuExamVO tchSelStuExamVO);
    //查询教师监考年级
    List<Map> selTchGrade(String tid);

}

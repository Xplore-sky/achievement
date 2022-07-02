/*
package com.nsapi.niceschoolapi.mapper;

import com.nsapi.niceschoolapi.entity.User;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    @Select("select * from student")
    @Results(value = {
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "sex", property = "sex"),
            @Result(column = "gid", property = "gid"),
            @Result(column = "major", property = "major"),
            @Result(
                    property = "roleList",
                    column = "id",
                    javaType = List.class,
                    many = @Many(select = "com.hx.dao.RoleMapper.findByUid")
            )
    })
    List<User> findUserAndRoleAll();



}
*/

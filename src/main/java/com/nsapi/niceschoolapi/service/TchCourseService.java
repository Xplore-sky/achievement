package com.nsapi.niceschoolapi.service;

import com.nsapi.niceschoolapi.entity.*;

import java.util.List;

public interface TchCourseService {
    //查询全部教师
    List<TeacherDB> findAllTch(TeacherDB teacherDB);
    //查询全部教师姓名
    List<TeacherDB> findAllTchByName();
    //通过专业查询全部课程
    List<TeacherDB> findAllCourseByMajorName(TchCourseVO tchCourseVO);
    //查询级联班级
    List<TeacherDB> findTchCourseClassName(ClassinfoDB classinfoDB);
    //查询周
    List<WeeksDB> findAllWeeks();
    //查询节段
    List<ScheduleDB> findAllSchedule();
    //添加教师监考表记录并返回新数据id
    int addOneTchCourse(TchCourseVO tchCourseVO);
    //添加教师授班表记录
    int addOneTchClass(TchCourseVO tchCourseVO);
    //查询是否有重复监考
    int findTchCourseFlag(TchCourseVO tchCourseVO);
    //查询是否有冲突监考
    int findTchCourseDanger(TchCourseVO tchCourseVO);
    //查询指定老师教授所有课程
    List<TchCourseVO> findCourseByTch(TchCourseVO tchCourseVO);
    //删除教师监考及班级
    int delTchCourse(TchCourseVO tchCourseVO);
}
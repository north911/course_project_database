package com.netcracker.etalon.controllers;

import com.netcracker.devschool.dev4.school.entity.*;
import com.netcracker.devschool.dev4.school.service.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.text.DateFormat;

import javax.xml.soap.Name;
import java.lang.reflect.Method;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
public class AdminPageController {

    @Autowired
    CabinetService cabinetService;

    @Autowired
    TeachersService teachersService;

    @Autowired
    SubjectService subjectService;

    @Autowired
    ClazzService clazzService;

    @Autowired
    PuplesService puplesService;

    @Autowired
    TimetableService timetableService;



    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String listCabinets(Model model){
        model.addAttribute("cabinet", new CabinetEntity());
        model.addAttribute("listCabinets", cabinetService.getAllCabinets());
        model.addAttribute("teacher",new TeachersEntity());
        model.addAttribute("listTeachers",teachersService.getAllTeachers());
        model.addAttribute("subject", new SubjectEntity());
        model.addAttribute("listSubjects",subjectService.getAllSubjects());
        model.addAttribute("classE", new ClazzEntity());
        model.addAttribute("listClasses", clazzService.getAllClasses());
        model.addAttribute("pupel",new PuplesEntity());
        model.addAttribute("listPupels", puplesService.getAllPupels());
        return "/admin";
    }

    @RequestMapping(value = "/time", method = RequestMethod.GET)
    public ModelAndView getTimetable(@RequestParam(value = "name") String name) {
        ModelAndView model = new ModelAndView("head");
       model.addObject( "listTime1",timetableService.findByIdTeacher(teachersService.findByLastName(name).getIdTeacher(),1));
        model.addObject( "listTime2",timetableService.findByIdTeacher(teachersService.findByLastName(name).getIdTeacher(),2));
        model.addObject( "listTime3",timetableService.findByIdTeacher(teachersService.findByLastName(name).getIdTeacher(),3));
        model.addObject( "listTime4",timetableService.findByIdTeacher(teachersService.findByLastName(name).getIdTeacher(),4));
        model.addObject( "listTime5",timetableService.findByIdTeacher(teachersService.findByLastName(name).getIdTeacher(),5));
        model.addObject("listTeachers",teachersService.getAllTeachers());
        model.addObject("listSubjects",subjectService.getAllSubjects());
        return model;
    }

    @RequestMapping(value = "/time2", method = RequestMethod.GET)
    public ModelAndView getTimetable2(@RequestParam(value = "name") String name) {
        ModelAndView model = new ModelAndView("head");
        model.addObject( "listTime1",timetableService.findByIdClass(clazzService.findByClassName(name).getIdClass(),1));
        model.addObject( "listTime2",timetableService.findByIdClass(clazzService.findByClassName(name).getIdClass(),2));
        model.addObject( "listTime3",timetableService.findByIdClass(clazzService.findByClassName(name).getIdClass(),3));
        model.addObject( "listTime4",timetableService.findByIdClass(clazzService.findByClassName(name).getIdClass(),4));
        model.addObject( "listTime5",timetableService.findByIdClass(clazzService.findByClassName(name).getIdClass(),5));
        model.addObject("listTeachers",teachersService.getAllTeachers());
        model.addObject("listSubjects",subjectService.getAllSubjects());
        return model;
    }


    @RequestMapping(value = "/addcab", method = RequestMethod.POST)
    public CabinetEntity addCabinet(@RequestParam(value = "idC" , required = false)int idC,
                                    @RequestParam(value = "fl", required = false) int floor){
        CabinetEntity cabinetEntity = new CabinetEntity();
        if(floor>0 && idC > 100){
            cabinetEntity.setFloor(floor);
            cabinetEntity.setIdCabinet(idC);
            cabinetService.addCabinet(cabinetEntity);}
        return cabinetEntity;
    }

    @RequestMapping(value = "/addt", method = RequestMethod.POST)
    public TeachersEntity addTeacher(@RequestParam(value = "fname" , required = false)String fname,
                                     @RequestParam(value = "lname" , required = false)String lname,
                                    @RequestParam(value = "qual", required = false) int qual,
                                    @RequestParam(value = "idS", required = false) int idS ){
        TeachersEntity teachersEntity = new TeachersEntity();
        if(fname!=null && lname!=null && qual > 0 && idS > 0){
            teachersEntity.setFirstName(fname);
            teachersEntity.setLastName(lname);
            teachersEntity.setQualification(qual);
            teachersEntity.setIdSubject(idS);
            teachersService.addTeacher(teachersEntity);
            }
        return teachersEntity;
    }

    @RequestMapping(value = "/addclass", method = RequestMethod.POST)
    public ClazzEntity addClass(@RequestParam(value = "className" , required = false)String classname,
                                @RequestParam(value = "manager" , required = false)String manager,
                                @RequestParam(value = "size" , required = false)int size){
        ClazzEntity clazzEntity = new ClazzEntity();
        clazzEntity.setClassManager(manager);
        clazzEntity.setClassName(classname);
        clazzEntity.setSize(size);
        clazzService.addClass(clazzEntity);
        return clazzEntity;
    }

    @RequestMapping(value = "/addpupel", method = RequestMethod.POST)
    public PuplesEntity addCabinet(@RequestParam(value = "firstname" , required = false)String firstname,
                                   @RequestParam(value = "lastname", required = false) String lastname,
                                   @RequestParam(value = "classId", required = false) int classId,
                                   @RequestParam(value = "sex", required = false) String sex,
                                   @RequestParam(value = "date", required = false)String date){
       PuplesEntity puplesEntity = new PuplesEntity();
       puplesEntity.setFirstName(firstname);
       puplesEntity.setLastName(lastname);
       puplesEntity.setIdClass(classId);


        DateFormat format = new SimpleDateFormat("MM/dd/yy", Locale.ENGLISH);
        try {
            Date start = format.parse(date);
            puplesEntity.setDateOfBirth(start);
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }


        if("male".equals(sex))
       puplesEntity.setSex("m");
        else
            puplesEntity.setSex("f");
       puplesService.addPupel(puplesEntity);


        return puplesEntity;
    }

    @RequestMapping("/removeCabinet/{id}")
    public String removeCabinet(@PathVariable("id") int id){
        cabinetService.deleteCabinetById(id);

        return "redirect:/admin";
    }

    @RequestMapping(value = "/editCabinet",method = RequestMethod.POST)
    public String editCabinet(@RequestParam(value = "idCab" , required = false)int id,
                              @RequestParam(value = "floor" , required = false)int floor){
        CabinetEntity cabinetEntity= cabinetService.findById(id);
        return "redirect:/admin";
    }

    @RequestMapping("/removePupel/{id}")
    public String removePupel(@PathVariable("id") int id){
        puplesService.deletePupelById(id);

        return "redirect:/admin";
    }

    @RequestMapping("/removeSubject/{id}")
    public String removeSubject(@PathVariable("id") int id){
        subjectService.deleteSubjectById(id);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/addsubject", method = RequestMethod.POST)
    public SubjectEntity addSubject(@RequestParam(value = "subName" , required = false)String subname){
        SubjectEntity subjectEntity = new SubjectEntity();
        subjectEntity.setName(subname);
        subjectService.addSubject(subjectEntity);
        return  subjectEntity;
    }

    @RequestMapping("/removeTeacher/{id}")
    public String removeTeacher(@PathVariable("id") int id){
        teachersService.deleteTeacherById(id);
        return "redirect:/admin";
    }

    @RequestMapping("/removeClass/{id}")
    public String removeClass(@PathVariable("id") int id){
        clazzService.deleteClassById(id);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/getTeachersBySubjectId/{id}", method = RequestMethod.GET)
    @ResponseBody
    public List<TeachersEntity> getTeachersBySubjectId(@PathVariable int id) {
        return teachersService.findBySubjectId(id);
    }





    @RequestMapping(value = "/addtime", method = RequestMethod.POST)
    public TimetableEntity addTime(@RequestParam(value = "classId" , required = false)String classId,
                                   @RequestParam(value = "numberLesson" , required = false)String numberLesson,
                                   @RequestParam(value = "numberDay" , required = false)String numberDay,
                                   @RequestParam(value = "idSubj" , required = false)String idSubj,
                                   @RequestParam(value = "idTeach" , required = false)String idTeach,
                                   @RequestParam(value = "idCab" , required = false)String idCab){

        TimetableEntity timetableEntity = new TimetableEntity();
        timetableEntity.setDayOfWeek(Integer.parseInt(numberDay));
        timetableEntity.setidCabinet(Integer.parseInt(idCab));
        timetableEntity.setidClass(Integer.parseInt(classId));
        timetableEntity.setidSubject(Integer.parseInt(idSubj));
        timetableEntity.setidTeacher(Integer.parseInt(idTeach));
        timetableEntity.setNumberOfLesson(Integer.parseInt(numberLesson));
        timetableService.saveTime(timetableEntity);

        return  timetableEntity;
    }

}

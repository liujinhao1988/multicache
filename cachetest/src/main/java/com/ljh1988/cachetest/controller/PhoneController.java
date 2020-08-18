package com.ljh1988.cachetest.controller;

import com.ljh1988.cachetest.entity.PhoneInfo;
import com.ljh1988.cachetest.service.PhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/phone")
public class PhoneController {
    @Autowired
    PhoneService phoneService;







    @GetMapping("/findSpecsByPhoneId/{phoneId}")
    public PhoneInfo findSpecsByPhoneId(@PathVariable("phoneId") Integer phoneId){
        PhoneInfo specsByPhoneId = phoneService.findSpecsByPhoneId(phoneId);

        return specsByPhoneId;
    }
}
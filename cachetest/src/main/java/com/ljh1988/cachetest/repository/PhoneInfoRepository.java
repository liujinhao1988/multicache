package com.ljh1988.cachetest.repository;

import com.ljh1988.cachetest.entity.PhoneInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PhoneInfoRepository extends JpaRepository<PhoneInfo,Integer> {


    PhoneInfo findByPhoneId(Integer phoneId);
}
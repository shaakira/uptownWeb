package com.uptown.uptown.repository;

import com.uptown.uptown.entity.Authority;
import com.uptown.uptown.entity.AuthorityType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorityRepository extends JpaRepository<Authority,Integer> {

    Authority findByName(AuthorityType name);
}

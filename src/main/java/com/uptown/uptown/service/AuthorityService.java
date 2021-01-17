package com.uptown.uptown.service;

        import com.uptown.uptown.entity.Authority;
        import com.uptown.uptown.entity.AuthorityType;
        import com.uptown.uptown.repository.AuthorityRepository;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Service;

@Service
public class AuthorityService {

    private AuthorityRepository authorityRepository;

    @Autowired
    public AuthorityService(AuthorityRepository authorityRepository) {
        this.authorityRepository = authorityRepository;
    }

    public Authority getRoleByName(AuthorityType roleName) {
        return authorityRepository.findByName(roleName);
    }
}

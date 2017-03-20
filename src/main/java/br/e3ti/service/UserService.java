package br.e3ti.service;

import br.e3ti.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}

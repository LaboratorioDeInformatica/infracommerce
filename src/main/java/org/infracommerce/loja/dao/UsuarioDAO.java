package org.infracommerce.loja.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.infracommerce.loja.models.Usuario;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAO implements UserDetailsService{

	@PersistenceContext
	private EntityManager manager;
	
	public Usuario loadUserByUsername(String email){
		List<Usuario> usuarios = manager.createQuery("select u from Usuario u where u.email =:email", Usuario.class)
		.setParameter("email", email)
		.getResultList();
		
		if(usuarios.isEmpty()){
			throw new UsernameNotFoundException("Usuario"+email+"não foi encontrado");
		}
		
		return usuarios.get(0);
	}

	public void gravar(Usuario usuario) {
	    manager.persist(usuario);
	}
	
}

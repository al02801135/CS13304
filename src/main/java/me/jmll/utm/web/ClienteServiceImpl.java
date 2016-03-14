package me.jmll.utm.web;

import me.jmll.utm.model.Cliente;

public class ClienteServiceImpl implements ClienteService {

	@Override
	public Cliente getCliente(long id) {
		// TODO Auto-generated method stub
		Cliente nuevoCliente = new Cliente();
		nuevoCliente.setId(id);
		return nuevoCliente;
	}

}

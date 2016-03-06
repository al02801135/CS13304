package me.jmll.utm;

public class HelloServiceImpl implements HelloService {

	@Override
	public String getHello(String name) {
		// TODO Auto-generated method stub
		return String.format("Welcome %s!", name).toString();
	}

}

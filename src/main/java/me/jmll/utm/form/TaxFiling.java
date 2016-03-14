package me.jmll.utm.form;

import java.util.List;

import javax.servlet.http.Part;

public class TaxFiling {
	private long SIN;
	private List<Part> taxDocs;
	
	public long getSIN() {
		return SIN;
	}
	public void setSIN(long sIN) {
		SIN = sIN;
	}
	public List<Part> getTaxDocs() {
		return taxDocs;
	}
	public void setTaxDocs(List<Part> taxDocs) {
		this.taxDocs = taxDocs;
	}
}

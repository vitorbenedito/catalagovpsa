package br.com.catalagovpsa.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.catalagovpsa.model.UploadedFile;
import br.com.catalagovpsa.service.interfaces.SynchronizeService;


@Transactional
@RequestMapping("/synchronize")
@Controller("synchronizeController")
public class SynchronizeController {

	@Autowired
	private SynchronizeService service;

	@RequestMapping(value = "/{cnpj}/{timestamp}", method = RequestMethod.GET)
	public @ResponseBody
	List<UploadedFile> synchronize(@PathVariable String cnpj, @PathVariable Long timestamp, ModelMap model) {
		Timestamp ts = new Timestamp(timestamp);
		Date date = new Date(ts.getTime());
//		return service.synchronize(cnpj, date);
		return null;
	}

}
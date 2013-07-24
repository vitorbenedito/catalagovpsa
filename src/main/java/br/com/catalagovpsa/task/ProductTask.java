package br.com.catalagovpsa.task;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import br.com.catalagovpsa.service.interfaces.SynchronizeService;

public class ProductTask extends QuartzJobBean {

	private Log log = LogFactory.getLog(ProductTask.class);

	private SynchronizeService synchronizeService;

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		log.debug("updating products database");
		synchronizeService.update();
		log.debug("products database updated");
	}

	public SynchronizeService getSynchronizeService() {
		return synchronizeService;
	}

	public void setSynchronizeService(SynchronizeService synchronizeService) {
		this.synchronizeService = synchronizeService;
	}

}

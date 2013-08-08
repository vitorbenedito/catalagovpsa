package br.com.catalagovpsa.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import br.com.catalagovpsa.model.Category;
import br.com.catalagovpsa.model.Customer;
import br.com.catalagovpsa.model.FileMeta;
import br.com.catalagovpsa.model.Product;
import br.com.catalagovpsa.repository.interfaces.CategoryRepository;
import br.com.catalagovpsa.repository.interfaces.ProductRepository;
import br.com.catalagovpsa.service.interfaces.CustomerService;

@Controller("productController")
@RequestMapping("/adm/product")
public class ProductController {    

	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/")
	public String index(Model model, HttpServletRequest request) throws Exception {

    	Customer customer = customerService.getCustomer();    
    	
		List<Product> products = new ArrayList<Product>();
		int numberOfPages = productRepository.numberOfPages(customer.getCnpj());
		return prepareView(customer, products, numberOfPages, 0, model, request);        
    }	
	
	@RequestMapping(value = "/filter/{filter}")
	public String filter(@PathVariable String filter, @RequestParam(required = false) Integer page, Model model, HttpServletRequest request) throws Exception {
		Customer customer = customerService.getCustomer();
		page = page == null ? 1 : page;
		List<Product> products = new ArrayList<Product>();
		int numberOfPages = 0;
		if(filter != null && !filter.isEmpty())
		{
			products = productRepository.filter(customer.getCnpj(), filter, page);
			numberOfPages = productRepository.numberOfPages(customer.getCnpj(), filter);
		}		
		return prepareView(customer, products, numberOfPages, page, model, request);
	}
	
	@RequestMapping(value = "/load/{idCategory}")
	public String load(@PathVariable Long idCategory, Model model, HttpServletRequest request) throws Exception {
				
		Customer customer = customerService.getCustomer();    
		List<Product> products = productRepository.loadProductsByCategory(customer.getCnpj(),idCategory);
	
		model.addAttribute("category", categoryRepository.get(customer.getCnpj(),idCategory));
				
		return prepareView(customer, products, 1, 0, model, request);
	}
		
	@RequestMapping(value = "/detail/{id}")
	public String details(@PathVariable Long id, Model model, HttpServletRequest request) throws Exception {
		Customer customer = customerService.getCustomer();
		Product product = productRepository.get(customer.getCnpj(), id);
		model.addAttribute("product", product);		
		model.addAttribute("categorys", getCategorys(customer));
		return "/product/detail";
	}
    	
	private String prepareView(Customer customer, List<Product> products, Integer numberOfPages, Integer currentPage, Model model, HttpServletRequest request) throws Exception {
				
		model.addAttribute("customer", customerService.getCustomer());
		model.addAttribute("categorys", getCategorys(customer));
		model.addAttribute("products", products);
		model.addAttribute("numberOfPages", numberOfPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("prevPage", (currentPage > 1 && numberOfPages > 1) ? currentPage - 1 : 1);
		model.addAttribute("nextPage", (currentPage > 1 && numberOfPages > 1) ? currentPage + 1 : 2);

		if (products.size() > 0) {
			model.addAttribute("product", products.get(0));
		}

		return "/product/list";
	}
	
	@RequestMapping(value="/upload/{productId}", method = RequestMethod.POST)
	public @ResponseBody LinkedList<FileMeta> upload(MultipartHttpServletRequest request, HttpServletResponse response,@PathVariable Long productId) throws Exception {
		
		Customer customer = customerService.getCustomer();
		Product product = productRepository.get(customer.getCnpj(), productId);
		
		LinkedList<FileMeta> files = product.getDetail().getPhotos();
		
		//1. build an iterator
		 Iterator<String> itr =  request.getFileNames();
		 MultipartFile mpf = null;

		 //2. get each file
		 while(itr.hasNext()){
			 
			 //2.1 get next MultipartFile
			 mpf = request.getFile(itr.next()); 
			 System.out.println(mpf.getOriginalFilename() +" uploaded! "+files.size());

			 //2.2 if files > 10 remove the first from the list
			 if(files.size() >= 10)
				 files.pop();
			 
			 //2.3 create new fileMeta
			 FileMeta fileMeta = new FileMeta();
			 fileMeta.setFileName(mpf.getOriginalFilename());
			 fileMeta.setFileSize(mpf.getSize()/1024+" Kb");
			 fileMeta.setFileType(mpf.getContentType());
			 
			 try {
				fileMeta.setBytes(mpf.getBytes());
				
				InputStream input = new ByteArrayInputStream(fileMeta.getBytes());
				
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				
				Thumbnails.of(input)
		        .size(160, 160)
		        .toOutputStream(out);
				
				fileMeta.setThumbnail( out.toByteArray() );
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 //2.4 add to files
			 files.add(fileMeta);
			 
		 }
		 
		 productRepository.add(product);
		 
		return files;
 
	}

	@RequestMapping(value = "/download/{value}/{productId}", method = RequestMethod.GET)
	 public void download(HttpServletResponse response,@PathVariable String value,@PathVariable Long productId) throws Exception{
		
		Product product = productRepository.get(customerService.getCustomer().getCnpj(), productId);
		
		 FileMeta getFile = product.getDetail().getPhotos().get(Integer.parseInt(value));
		 try {		
			 	response.setContentType(getFile.getFileType());
			 	response.setHeader("Content-disposition", "attachment; filename=\""+getFile.getFileName()+"\"");
		        FileCopyUtils.copy(getFile.getBytes(), response.getOutputStream());
		 }catch (IOException e) {				
				e.printStackTrace();
		 }
	 }
	
	@RequestMapping(value = "/get/{value}/{productId}", method = RequestMethod.GET)
	 public void get(HttpServletResponse response,@PathVariable Integer value,@PathVariable Long productId) throws Exception{
		
		Product product = productRepository.get(customerService.getCustomer().getCnpj(), productId);
		
		 FileMeta getFile = product.getDetail().getPhotos().get(value);
		 try {		
			 	
			 response.setContentType("image/jpeg");
			 response.getOutputStream().write(getFile.getThumbnail());
		 }catch (IOException e) {				
				e.printStackTrace();
		 }
	 }

	private Map<Category, List<Category>> getCategorys(Customer customer) {
		List<Category> list = categoryRepository.all(customer.getCnpj());
		
		Map<Category,List<Category>> map = new HashMap<Category, List<Category>>();
		
		for(Category item: list)
		{
			if(item.getFatherId() == null)
			{
				List<Category> suns = new ArrayList<Category>();
				
				for(Category sun : list)
				{
					if(sun.getFatherId() != null && sun.getFatherId().equals(item.getId()))
					{
						suns.add(sun);
					}
				}
								
				map.put(item, suns);
								
			}
		}
		return map;
	}
		
}

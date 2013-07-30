package br.com.catalagovpsa.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ParametrosRest {

	private static final String DD_MM_YYYY = "dd-MM-yyyy";
	private static final String HH_MM_SS = "HH:mm:ss";
	public static final String PARAMETRO_ENTIDADES = "entidades";
	public static final String PARAMETRO_DESDE = "desde";
	public static final String PARAMETRO_ATE = "ate";
	public static final String PARAMETRO_PAGINACAO_INICIO = "inicio";
	public static final String PARAMETRO_PAGINACAO_QUANTIDADE = "quantidade";
	public static final String PARAMETRO_TERCEIRO = "terceiro";
	public static final String PARAMETRO_ALTERADO_APOS = "alteradoApos";
	private static final String SEPARADOR_IDS = ",";
	
	private static final int DIA = 0;
	private static final int MES = 1;
	private static final int ANO = 2;

	private static SimpleDateFormat sdfData = new SimpleDateFormat(DD_MM_YYYY);
	private static SimpleDateFormat sdfHorario = new SimpleDateFormat(HH_MM_SS);
	private static SimpleDateFormat sdfDataEHora = new SimpleDateFormat(DD_MM_YYYY + " " + HH_MM_SS);
	
	public static Calendar stringToCalendar(String dataString){
		if (dataString == null) {
			return null;
		}
		dataString = dataString.trim().replaceAll("/", "-");
		Calendar data = Calendar.getInstance();
		try {
			parseDate(dataString, data);
			validateParsedDate(dataString, data);
		} catch (Exception e) {
			return null;
		}
		return data;
	}

	private static void parseDate(String dataString, Calendar data) throws ParseException {
		if (dataString.length() == 10) {
			data.setTime(sdfData.parse(dataString));
		} else {
			data.setTime(sdfDataEHora.parse(dataString));
		}
	}

	private static void validateParsedDate(String dataString, Calendar data) {
		dataString = dataString.split(" ")[0];
		boolean valid = data.get(data.DAY_OF_MONTH) == getDateFieldFrom(dataString, DIA);
		valid &= data.get(data.MONTH) == getDateFieldFrom(dataString, MES) - 1;
		valid &= data.get(data.YEAR) == getDateFieldFrom(dataString, ANO);
		if(!valid){
			return;
		}
	}
	
	private static Integer getDateFieldFrom(String dataString, int field) {
		return new Integer(dataString.split("-")[field]);
	}
	
	public static String calendarToString(Calendar data){
		if (data == null) {
			return null;
		}
		return sdfData.format(data.getTime());
	}

	public static String calendarToStringHorario(Calendar data){
		if (data == null) {
			return null;
		}
		return sdfHorario.format(data.getTime());
	}

	public static String calendarToStringDataHora(Calendar data){
		if (data == null) {
			return null;
		}
		return sdfDataEHora.format(data.getTime());
	}
	
	public static void setHorarioOnCalendar(Calendar data, String horario) throws ParseException {
		if (data == null || horario == null) {
			return;
		}
		 Date parsedHorario = sdfHorario.parse(horario);
		 data.set(Calendar.HOUR_OF_DAY, parsedHorario.getHours());
		 data.set(Calendar.MINUTE, parsedHorario.getMinutes());
		 data.set(Calendar.SECOND, parsedHorario.getSeconds());
	}

	public static List<Long> parseIdList(String param){
		if (param == null) {
			return null;
		}
		param = param.replaceAll("[A-z]", "").trim();
		if (param.length() == 0) {
			return null;
		}
		Set<Long> idsSet = new HashSet<Long>();
		String[] ids = param.split(SEPARADOR_IDS);
		for (String id : ids) {
			idsSet.add(Long.parseLong(id));
		}
		return idsSet.size() > 0 ? new ArrayList<Long>(idsSet) : null;
	}
	
}
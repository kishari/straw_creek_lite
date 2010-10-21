package hu.dbx.screek.model;

public class Constants {
	//Biztosítási időtartam típusok (Quote.durationType)
	public static final Integer DT_HATAROZATLAN = 1;
	public static final Integer DT_HATAROZOTT = 2;
	
	//Jármű típusok (Vehicle.typeCode)
	public static final String TC_SZEMELYGEPJARMU = "10";
	public static final String TC_TEHERGEPJARMU = "14";
	public static final String TC_MOTORKEREKPAR = "11";
	public static final String TC_AUTOBUSZ = "12";
	public static final String TC_TROLIBUSZ = "13";
	public static final String TC_VONTATO = "15";
	public static final String TC_KONNYU_POTKOCSI = "16";
	public static final String TC_NEHEZ_POTKOCSI = "17";
	public static final String TC_SZEMELYGEPKOCSI_UTANFUTO = "18";
	public static final String TC_LAKOKOCSI = "19";
	public static final String TC_MOTORKEREKPAR_UTANFUTO = "20";
	public static final String TC_MEZOGAZDASAGI_VONTATO = "21";
	public static final String TC_LASSUJARMU = "22";
	public static final String TC_MUNKAGEP = "23";
	public static final String TC_SEGEDMOTOROS_KEREKPAR = "24";
	public static final String TC_PROBA_RENDSZAM = "27";
	

	
	//Partner típusok (Partner.genderCode)
	public static final Integer NO = 1;
	public static final Integer FERFI = 2;
	public static final Integer JOGI_SZEMELY = 3;
	
	//Fizetési gyakoriságok (Quote.paymentFrequency)
	public static final Integer PF_HAVI = 12;
	public static final Integer PF_NEGYEDEVES = 4;
	public static final Integer PF_FELEVES = 2;
	public static final Integer PF_EVES = 1;
	
	//Fizetési mód (Quote.paymentMethod)
	public static final String PM_ATUTALAS = "0";
	public static final String PM_BANKI_CSOPORTOS_BESZEDES = "1";
	public static final String PM_POSTAI_CSEKK = "2";
	
	//Üzemeltetési jelleg (Vehicle.operationalModality)
	public static final Integer OM_NORMAL = 1;

	//Kedvezmények, pótdíjak (ModFactorDef.modfactorType)
	public static final Integer MF_CASCO = 1;
	public static final Integer MF_BANKI_CSOPORTOS_LEHIVAS = 2;
	public static final Integer MF_ONLINE4 = 3;
	public static final Integer MF_ONLINE8 = 4;
	public static final Integer MF_GYERMEK = 5;
	public static final Integer MF_MKB_PARTNER = 6;
	public static final Integer MF_EMAIL = 7;
	public static final Integer MF_EXTRA_KARMENTESSEG = 8;
	public static final Integer MF_UZEMELTETES = 9;
	
	
}

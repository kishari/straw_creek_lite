package hu.dbx.screek.model;

public class Constants {
	//Biztosítási időtartam típusok (Quote.durationType)
	public static final Integer DT_HATAROZATLAN = 1;
	public static final Integer DT_HATAROZOTT = 2;
	
	//Jármű típusok (Vehicle.typeCode)
	public static final Integer TC_SZEMELYGEPJARMU = 1;
	public static final Integer TC_TEHERGEPJARMU = 2;
	public static final Integer TC_MOTORKEREKPAR = 3;
	public static final Integer TC_AUTOBUSZ = 4;
	public static final Integer TC_TROLIBUSZ = 5;
	public static final Integer TC_VONTATO = 6;
	public static final Integer TC_KONNYU_POTKOCSI = 7;
	public static final Integer TC_NEHEZ_POTKOCSI = 8;
	public static final Integer TC_SZEMELYGEPKOCSI_UTANFUTO = 9;
	public static final Integer TC_LAKOKOCSI = 10;
	public static final Integer TC_MOTORKEREKPAR_UTANFUTO = 11;
	public static final Integer TC_MEZOGAZDASAGI_VONTATO = 12;
	public static final Integer TC_LASSUJARMU = 13;
	public static final Integer TC_MUNKAGEP = 14;
	public static final Integer TC_SEGEDMOTOROS_KEREKPAR = 15;
	
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
	public static final Integer PM_BANKI_CSOPORTOS_BESZEDES = 1;
	public static final Integer PM_EGYEB = 2;
	
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

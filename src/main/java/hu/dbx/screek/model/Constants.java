package hu.dbx.screek.model;

public class Constants {
	//Biztosítási időtartam típusok (Quote.durationType)
	public static final Integer DT_HATAROZATLAN = 1;
	public static final Integer DT_HATAROZOTT = 2;
	
	//Jármű típusok (Vehicle.typeCode)
	public static final String TC_SZEMELYGEPJARMU = "10";
	public static final String TC_MOTORKEREKPAR = "11";
	public static final String TC_AUTOBUSZ = "12";
	public static final String TC_TROLIBUSZ = "13";
	public static final String TC_TEHERGEPJARMU = "14";
	public static final String TC_VONTATO = "15";
	public static final String TC_POTKOCSI_075IG = "16";
	public static final String TC_POTKOCSI_075_10 = "17";
	public static final String TC_POTKOCSI_10PLUS = "18";
	//public static final String TC_SZEMELYGEPKOCSI_UTANFUTO = "18"; //Ezek (18, 19, 20) be lettek olvasztva a 16-os kód alá
	//public static final String TC_LAKOKOCSI = "19";
	//public static final String TC_MOTORKEREKPAR_UTANFUTO = "20";
	public static final String TC_MEZOGAZDASAGI_VONTATO = "21";
	public static final String TC_LASSUJARMU = "22";
	public static final String TC_MUNKAGEP = "23";
	public static final String TC_SEGEDMOTOROS_KEREKPAR = "24";
	public static final String TC_QUAD = "25";
	public static final String TC_PROBA_RENDSZAM = "27";
	

	
	//Partner típusok (Partner.genderCode)
	public static final Integer NO = 1;
	public static final Integer FERFI = 2;
	public static final Integer JOGI_SZEMELY = 3;
	
	//Fizetési gyakoriságok (Quote.paymentFrequency)
	public static final String PF_EGYSZERI = "47";
	public static final String PF_HAVI = "48"; //havi díjfizetés: megszűnt 2011-ben
	public static final String PF_NEGYEDEVES = "49";
	public static final String PF_FELEVES = "50";
	public static final String PF_EVES = "51";
	
	//Fizetési mód (Quote.paymentMethod)
	public static final String PM_ATUTALAS = "0";
	public static final String PM_BANKI_CSOPORTOS_BESZEDES = "1";
	public static final String PM_POSTAI_CSEKK = "2";
	
	//Üzemeltetési jelleg (Vehicle.operationalModality)
	public static final String OM_NORMAL = "000";

	//Kedvezmények, pótdíjak (ModFactorDef.modfactorType)
	public static final Integer MF_MKBB_CASCO = 1;
	public static final Integer MF_NEM_MKBB_CASCO = 10;
	public static final Integer MF_BANKI_CSOPORTOS_LEHIVAS_VAGY_ATUTALAS = 2;
	public static final Integer MF_ONLINE4 = 3; //csak 2010-esben
	public static final Integer MF_ERTEKESITESI_PARTNER = 3; //csak 2011-ben
	public static final Integer MF_ONLINE8 = 4; //csak 2010-esben
	public static final Integer MF_GYERMEK = 5;
	public static final Integer MF_MKB_PARTNER = 6;
	public static final Integer MF_EMAIL = 7;
	public static final Integer MF_EXTRA_KARMENTESSEG = 8;
	public static final Integer MF_UZEMELTETES = 9;
	public static final Integer MF_KOZTISZTVISELO = 11; //csak 2011-ben
	public static final Integer MF_KOZALKALMAZOTT = 12; //csak 2011-ben
	public static final Integer MF_TANAR = 13; //csak 2011-ben
	public static final Integer MF_KISVALLALKOZO = 14; //csak 2011-ben
	public static final Integer MF_KAMPANY = 15; //csak 2011-ben
	public static final Integer MF_NEMET_MAGYAR_KERESK_KAMARA_TAGSAG = 16; //csak 2011-ben
	
	
}

package hu.dbx.screek.util;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;

public class GenAreaDef2011 {

	private List<String[]> l;
	
	private static List<Integer> postCodes2010 = new ArrayList<Integer>();
	private static List<Integer> postCodes2011 = new ArrayList<Integer>();
	
	List<RowObject> rowObjects2010 = new ArrayList<RowObject>();
	List<RowObject> rowObjects2011 = new ArrayList<RowObject>();
	List<RowObject> rowObjects = new ArrayList<RowObject>();
	
	
	public static List<Integer> getPostCodes2010() {
		return postCodes2010;
	}

	public static List<Integer> getPostCodes2011() {
		return postCodes2011;
	}

	private String readFileAsString(String filePath) throws IOException{
	    byte[] buffer = new byte[(int) new File(filePath).length()];
	    BufferedInputStream f = new BufferedInputStream(new FileInputStream(filePath));
	    f.read(buffer);
	    return new String(buffer);
	}
	
	private void splitPostCodes(String postCodes) {
		String[] p = postCodes.split(" ");
		for (String s : p) {
			postCodes2011.add(Integer.parseInt(s.trim()));
		}
	}
	private void parse2011(String path)throws IOException {
		rowObjects2011.clear();
		CSVReader reader = new CSVReader(new FileReader(path), ';');
		l = reader.readAll();
		
		l.remove(0);
		boolean isRedundant = false;
		for (String[] s : l) {
			//System.out.println(s[0]);
			if (postCodes2011.contains(Integer.parseInt(s[0]))) {
				System.out.println("Redundáns postCode: " + s[0] + " (Area: " + s[1] + ")");
				isRedundant = true;
			}
			else {
				postCodes2011.add(Integer.parseInt(s[0]));	
				
				RowObject r = new RowObject();
				r.setPostCode(s[0]);
				r.setAreaCode(s[1]);
				r.setValidFrom("2011-01-01");
				r.setValidTo("2011-12-31");
				
				rowObjects2011.add(r);
			}
			
		}
		System.out.println("parse 2011 lefutott! " + isRedundant);
	}
	
	public void buildAreaCSV2011(String path, String fileName) throws IOException {
		File clearAreaDefFile = new File(path, fileName);
		Writer writer = null;
		writer = new BufferedWriter(new FileWriter(clearAreaDefFile));
		
		writer.write("\"POST_CODE\";\"TARIFF_CODE\";\"VALID_FROM\";\"VALID_TO\"\n");
		
		for (RowObject row : rowObjects2010) {
				
			writer.write("\"" + row.getPostCode() + "\";\"" + 
								row.getAreaCode() + "\";\"" + 
								row.getValidFrom() + "\";\"" + 
								row.getValidTo() + "\"\n");

		}
		
		for (RowObject row : rowObjects2011) {
			
			writer.write("\"" + row.getPostCode() + "\";\"" + 
								row.getAreaCode() + "\";\"" + 
								row.getValidFrom() + "\";\"" + 
								row.getValidTo() + "\"\n");

		}
			
		writer.close();
	}
	
	private void parse2010(String path) throws IOException {
		CSVReader reader = new CSVReader(new FileReader(path), ';');
		l = reader.readAll();
		rowObjects2010.clear();
		
		l.remove(0);
		
		for (String[] s : l) {
			if (postCodes2010.contains(Integer.parseInt(s[0]))) {
				System.out.println("Redundáns postCode: " + s[0] + " (Area: " + s[1] + ")");
			}
			else {
				postCodes2010.add(Integer.parseInt(s[0]));
				RowObject r = new RowObject();
				r.setPostCode(s[0]);
				r.setAreaCode(s[1]);
				r.setValidFrom(s[2]);
				r.setValidTo(s[3]);
				
				rowObjects2010.add(r);
			}
			
		}
		System.out.println("parse 2010 lefutott!");
	}
	
	private void buildArea1() {
		for (Integer p2010 : postCodes2010) {
			if (!postCodes2011.contains(p2010) && p2010 >= 1000 && p2010 < 2000) {
				//Ha a 2011-esben még nincs benne, de a 1000 és 2000 között van akkor betesszük a 2011-be
				postCodes2011.add(p2010);
			}
		}
	}
	
	private void buildArea5() {
		for (Integer p2010 : postCodes2010) {
			if (!postCodes2011.contains(p2010) && p2010 >= 2000) {
				//Ha a 2011-esben még nincs benne, de a 2000 fölötti van akkor betesszük a 2011-be
				postCodes2011.add(p2010);
			}
		}
	}
	
	private void genTestCSV() throws IOException {
		File clearAreaDefFile = new File("./data/", "AreaDefTest2010.csv");
		Writer writer = null;
		writer = new BufferedWriter(new FileWriter(clearAreaDefFile));
		
		writer.write("\"POST_CODE2010\"\n");
		
		for (Integer i : getPostCodes2010()) {						
			writer.write("\"" + i + "\"\n"); 
		}
			
		writer.close();
		
		File clearAreaDefFile2011 = new File("./data/", "AreaDefTest2011.csv");
		Writer writer2011 = null;
		writer2011 = new BufferedWriter(new FileWriter(clearAreaDefFile2011));
		
		writer2011.write("\"POST_CODE2011\"\n");
		
		for (Integer i : getPostCodes2011()) {						
			writer2011.write("\"" + i + "\"\n"); 
		}
			
		writer2011.close();

	}
	
	public void buildNewCSV(String path, String fileName) throws IOException {
		File clearAreaDefFile = new File(path, fileName);
		Writer writer = null;
		writer = new BufferedWriter(new FileWriter(clearAreaDefFile));
		
		//writer.write("\"POST_CODE\";\"TARIFF_CODE\";\"VALID_FROM\";\"VALID_TO\"\n");
		
		for (RowObject row : rowObjects) {
				
/*			writer.write("\"" + row.getPostCode() + "\";\"" + 
								row.getAreaCode() + "\";\"" + 
								row.getValidFrom() + "\";\"" + 
								row.getValidTo() + "\"\n");
*/								
			writer.write("\"" + row.getPostCode2010() + "\";\"" + 
								row.getPostCode2011() + "\"\n"); 
		}
			
		writer.close();
	}
	
	public static void main(String[] args) {
		GenAreaDef2011 csv = new GenAreaDef2011();
		try {
			csv.parse2010("./data/AreaDef2010.csv");
			csv.parse2011("./data/AreaDef2011Thin.csv");
			csv.buildAreaCSV2011("./data/", "AreaDef2011.csv");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private class RowObject {
		
		private String postCode;
		private String postCode2010;
		private String postCode2011;
		private String areaCode;
		private String validFrom;		
		private String validTo;
		
		public String getPostCode2011() {
			return postCode2011;
		}
		public void setPostCode2011(String postCode2011) {
			this.postCode2011 = postCode2011;
		}
		
		public String getPostCode() {
			return postCode;
		}
		public void setPostCode(String postCode) {
			this.postCode = postCode;
		}
		public String getAreaCode() {
			return areaCode;
		}
		public void setAreaCode(String areaCode) {
			this.areaCode = areaCode;
		}
		public String getValidFrom() {
			return validFrom;
		}
		public void setValidFrom(String validFrom) {
			this.validFrom = validFrom;
		}
		public String getValidTo() {
			return validTo;
		}
		public void setValidTo(String validTo) {
			this.validTo = validTo;
		}
		public void setPostCode2010(String postCode2010) {
			this.postCode2010 = postCode2010;
		}
		public String getPostCode2010() {
			return postCode2010;
		}
		
	}
}

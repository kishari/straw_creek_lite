package hu.dbx.screek.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;

public class ClearAreaDefCSV {

	private List<String[]> l;
	
	private List<Integer> postCodes = new ArrayList<Integer>();
	List<RowObject> rowObjects = new ArrayList<RowObject>();
	
	private void parse(String path) throws IOException {
		CSVReader reader = new CSVReader(new FileReader(path), ';');
		l = reader.readAll();
		
		l.remove(0);
		
		for (String[] s : l) {
			if (postCodes.contains(Integer.parseInt(s[0]))) {
				System.out.println("Redundáns postCode: " + s[0] + " (Area: " + s[1] + ")");
			}
			else {
				postCodes.add(Integer.parseInt(s[0]));
				
				RowObject row = new RowObject();
				row.setPostCode(s[0]);
				row.setAreaCode(s[1]);
				row.setValidFrom(s[2]);
				row.setValidTo(s[3]);
				
				rowObjects.add(row);
			}
			
		}		
	}
	
	public void buildNewCSV(String path, String fileName) throws IOException {
		File clearAreaDefFile = new File(path, fileName);
		Writer writer = null;
		writer = new BufferedWriter(new FileWriter(clearAreaDefFile));
		
		writer.write("\"POST_CODE\";\"TARIFF_CODE\";\"VALID_FROM\";\"VALID_TO\"\n");
		
		for (RowObject row : rowObjects) {
				
			writer.write("\"" + row.getPostCode() + "\";\"" + 
								row.getAreaCode() + "\";\"" + 
								row.getValidFrom() + "\";\"" + 
								row.getValidTo() + "\"\n");
		}
			
		writer.close();
	}
	
	public static void main(String[] args) {
		ClearAreaDefCSV csv = new ClearAreaDefCSV();
		try {
			csv.parse("./data/AreaDefOrigin.csv");
			csv.buildNewCSV("./data/", "AreaDef.csv");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private class RowObject {
		
		private String postCode;
		private String areaCode;
		private String validFrom;
		private String validTo;
		
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
		
	}

}

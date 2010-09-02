package hu.dbx.log4j;

import java.io.File;
import java.util.Comparator;

public class FileLastModifiedComparator implements Comparator<File>{

	public int compare(File f1, File f2) {
		  if (f1.lastModified() - f2.lastModified() < 0) {
			  return 1;
		  }
		  else if (f1.lastModified() - f2.lastModified() == 0) {
			  return 0;
		  }
		  else {
			  return -1;
		  }
	}

}

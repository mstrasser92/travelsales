package org.ist.OAD14.General.Interface;

/**
 * Interface for saving/reading Objects into/from the Database via Hibernate
 * 
 * @author Stettinger
 *
 */

public interface ISaveAndDelete {

	/**
	 * Save Method
	 * 
	 * @return true if save was successful - false otherwise
	 */
	public boolean saveToDB();
	
	/**
	 * Deletes the Object from the Database
	 */
	public void deleteFromDB();
}

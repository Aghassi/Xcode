/**
* Israel Tech Challenge Code Warm Up
*
* Goal is to compare two strings and find the first
* index where they have the same character
* @author David Aghassi
* 1/5/2015
**/

import java.util.HashMap;

public class IsraelCodeRetry {
	public static void main(String[] args) {
		System.out.print(compare(str, string));
		System.out.print("\n");
	}


	/**Class Gloval variables**/
	private static String string = "IsraelTechChallengeInterns2015";
	private static String str = "987654";

	public static String getString(){
		return string;
	}

	public static String getStr(){
		return str;
	}

	/**
	* A method to compare two string to find the first character that exists in both
	* @param baseString The string being read into a hashMap
	* @param compareString The string being iterated over to find like characters
	* @return -1 if no string, or null parameters, the index of the char otherwise
	**/
	public static Integer compare (String baseString, String compareString){
		//Null check
		if(checkIfEmpty(baseString, compareString)){
			return -1;
		}

		/**Variables**/
		String baseStr = baseString.trim();
		String compareStr = compareString.trim();

		//Create hashmap to store compareString to index of char
		HashMap<Character, Integer> compareMap = new HashMap<Character, Integer>();
		for (int i = 0; i < compareString.length() ; i++ ) {
			compareMap.put(compareString.charAt(i), i);
		}

		//Check against hashmap for values
		//charAt is zero based when counting
		for (int i = 0; i < baseString.length(); i++){
			if (compareMap.containsKey(baseString.charAt(i))) {
				return i;
			}
		}


		return -1;
	}


	private static boolean checkIfEmpty(String... checks){
		//Checks all params for null
		for (String check : checks ){
			if(check.equals(null)){
				return true;
			}
		}

		return false;
	}
}
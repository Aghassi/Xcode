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

	private static boolean checkIfEmpty(String one, String two){
		return (one.equals(null) || two.equals(null));
	}
}
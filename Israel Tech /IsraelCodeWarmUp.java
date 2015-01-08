public class IsraelCodeWarmUp {

	public static void main(String[] args) {
		System.out.print(compare(set, str));
		System.out.print("\n");
	}

	/**Class Gloval variables**/
	private static String set = "set";
	private static String str = "str";

	public static String getSet(){
		return set;
	}

	public static String getStr(){
		return str;
	}

	public static Integer compare (String str1, String set1){
		//Null check
		if(checkIfEmpty(str, set)){
			return -1;
		}

		/**Variables**/
		int index = smallestString(str1, set1);
		String setString = getSet().trim();
		String strString = getStr().trim();

		//Check characters at each point 
		//in the string for the first matching character
		for(int i = 0; i < index; i++){
			if(set1.charAt(i) == str1.charAt(i)){
				return i;
			}
		}

		return -1;
	}

	private static boolean checkIfEmpty(String one, String two){
		return (one.equals(null) || two.equals(null));
	}

	private static Integer smallestString(String one, String two){
		if(one.length() < two.length()){
			return one.length();
		}
		else{
			return two.length();
		}
	}

}
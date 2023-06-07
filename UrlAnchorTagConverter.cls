/**
 * The UrlAnchorTagConverter class provides a utility method to convert URLs in a string to HTML anchor tags.
 * URLs starting with 'http' or containing 'www' will be replaced with appropriate anchor tags.
 */
public class UrlAnchorTagConverter {

    /**
     * Converts URLs in a string to HTML anchor tags.
     *
     * @param str The input string to process.
     * @return The modified string with URLs replaced by anchor tags.
     */
    public static String changeUrlsInStringToAnchorTag(String str) {
        // Check if the string contains URLs
        if (str.toLowerCase().contains('http') || str.toLowerCase().contains('www')) {
            // Preprocess the string to ensure correct replacement
            String updatedUrl = str.replaceAll('http', ' http').replaceAll('\\)', ' \\)').replaceAll('>', ' >');
            List<String> stringList = updatedUrl.split(' ');
            String output = '';
            for (String each : stringList) {
                String concat = '';
                // Replace URLs starting with 'http'
                if (each.toLowerCase().contains('http')) {
                    concat = '<a href="' + each + '" target="_blank">' + 'URL_Text' + '</a>';
                }
                // Replace URLs containing 'www'
                else if (each.toLowerCase().contains('www')) {
                    concat = each.substringBefore('www') + ' ' + '<a href="https://www' + each.substringAfter('www') + '" target="_blank">' + 'URL_Text' + '</a>';
                }
                // Keep non-URL strings unchanged
                else {
                    concat = each;
                }

                // Concatenate the converted strings with spaces
                if (String.isBlank(output) || output == '') {
                    output = concat;
                } else {
                    output = output + ' ' + concat;
                }
            }
            return output;
        } else {
            // If the string does not contain any URLs, return the original string
            return str;
        }
    }
}

// Generates one of the ratings according to score. 
function generate_message(rating) {
	
message_options = [

// Zero-star messages
[
	"My children won't stop crying. At least, the ones left. Would not recommend."
],

// One-star messages
[
	"I mean, I guess we're still alive. So, not the worst."
],

// Two-star messages
[
	"I got fused with my coworker. But, now we only have 1 commute to work. 2 stars."
],

// Three-star messages
[
	"The Match Doctor is kinda underrated. Our town numbers are way up. Our military is at an all-time high. Would recommend."
]

];


	return string_concat("\"", message_options[rating][irandom_range(0, array_length(message_options[rating]) - 1)], "\"");
}
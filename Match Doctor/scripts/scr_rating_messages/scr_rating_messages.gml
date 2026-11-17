// Generates one of the ratings according to score. 
function generate_message(rating) {
	
message_options = [

// Zero-star messages
[
	//"My children won't stop crying. At least, the ones left. Would not recommend.",
	//"I need the address for his \"bird college\". I'm going to write a strongly worded letter. Do we still have a carrier pigeon that isn't dead??",
	"This Doctor is so bad, I hope the people who made this game fail their class."
],

// One-star messages
[
	"I mean, I guess we're still alive. So, not the worst.",
	"I got fused with my boss, and now he is asking for the Monday report.",
	"How can the Doctor do all of this but still can't cure my migraines?",
	"Talk about a momma's boy. Sheesh. Overrated.",
	"He merged my two children and now they scream twice as loud at night.",
	"He merged my mom with my dad. Now they team up against me about my homework. This sucks dude."
],

// Two-star messages
[
	"I got fused with my coworker. But, now we only have 1 commute to work. 2 stars.",
	"Great service, but he wouldn't stop talking about the 8 PhD's that he got from his mom.",
	"The town is saved, I just haven't seen my son after he visited the doctor.",
	"It feels good to defend this town but he took me from my home.",
	"I've heard the rumors about Match Doctor being a \"fascist try-hard,\" but honestly he seems pretty alright. Would merge again, but I do wish fewer of my friends died.",
	"I sometimes feel his powers aren't real, but hey, at least the line at Birdbath & Body Works isn't as long."
],

// Three-star messages
[
	"The Match Doctor is kinda underrated. Our town numbers are way up. Our military is at an all-time high. Would recommend.",
	"I don't remember having the ability to create fire, but it helped save the town at least!",
	"Till death do us part has never felt so literal!",
	"I solemnly pledge to devote my life to him. He's made my neighbors half as obnoxious!!"
]

];


	return string_concat("\"", message_options[rating][irandom_range(0, array_length(message_options[rating]) - 1)], "\"");
}
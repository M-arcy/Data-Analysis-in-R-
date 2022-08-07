install.packages("sentiment.ai")
install.packages("sentimentAnalysis")
install.packages("sentimentr")
install_sentiment.ai()

install.packages("SnowballC")
# Load the packages
require(sentiment.ai)
require(SentimentAnalysis)
require(sentimentr)
#To activate this environment, use
#
#     $ conda activate r-environment
#
# To deactivate an active environment, use
#
#     $ conda deactivate
# only use this for first time ever running - sentiment.ai.install()

#to get working directory
getwd()

setwd("C:/Users/Marcy/anaconda3/envs/r-sentiment-ai")
getwd()
# Initiate the model
# This will create the sentiment.ai.embed model
# Do this so it can be reused without recompiling - especially on GPU!
init_sentiment.ai()


text <- c("love salsas", 
          "great food", 
          "i love salsas",
          "food is very good there",
          "yes the food is awesome", 
          "they do have some of the nicest staff and décor", 
          "we love salsas", 
          "yall need to get out more", 
          "better suggestion i'm interested in something better to try", 
          "they do have some of the nicest staff & decor!!!", 
          "we love salsas!",
          "better suggestion? i'm interested in something better to try.",
          "don julio there are a few of them", 
          "never been there. i'll check it out. thanks.",  
          "never been there either. thanks!", 
          "they have really good queso and salsa!", 
          "i'm a big fan of salsa!! i love when places give you a refill at the table. like salsas does.", 
          "i enjoyed salsas however i will drive to waterford for don julios when i want mexican. it's that good", 
          "there is one in lk mary now", 
          "i agree -agave azul way better", 
          "bravo  where is this located?",
          "in oviedo at the nw corner of mitchell hammock/central (434 alafaya)",
          "i love that place! i can drink the salsa!",
          "me too and the margs are not so bad",
          "would love to!",
          "we were just talking about out first visit here. amazing food!",
          "the food is really good", 
          "where are they located?",
          "in oviedo at the nw corner of mitchell hammock/alafaya",
          "thanks for the info",
          "we must try",
          "i thought you've been there",
          "not that i remember",
          "restaurant is beautiful food is great and prices are so reasonable!",
          "that's awesome",
          "they are located on mitchell hammock and 434 in oveido",
          "i went there once in july and it officially became my favorite mexican restaurant!",
          "it's a great place. so happy to good news about the management",
          "such a nice and relaxing place to go.",
          "never been where is this? link???",
          "i just googled. it's off mitchell hammock and sharon ct.",
          "love this place",
          "i agree , very yummy authentic food.",
          "one of my favorites!!",
          "this place is great!",
          "the food was good saw ex-employees from agave azul there. still prefer agave azul in winter springs, but really nice and well decorated. if you are in town, not bad.",
          "thanks will try it",
          "love it!",
          "yes they're best food is always good ambiance and service too  salsas cocina oviedo",
          "love this place!",
          "i want to try this place . i hear it's great!",
          "it's delicious!",
          "we need to go!!",
          "love the chips and salsa",
          "still want to try!",
          "food is great!!",
          "i love the food, i just can't stand the loud music for inside dining. if there is not room for outside dining i would leave.",
          "wife and i went there last week. was very good and not super expensive",
          "i will give it a try!",
          "one of my favorites",
          "they used to have a dish we loved but they no longer have it. i miss chicken con crema",
          "good food but the music is way too loud. even after we asked them to lower the volume they kept turning it back up. this has happened to us the last 2 times we ate there.",
          "my fav!",
          "we have been a few times and loved it!",
          "love salsas!",
          "where is it located?",
          "i enjoyed the one in cocoa need to still get here.",
          "food and margs are so good!",
          "we still need to try this place..",
          "i have been to the one in palm coast but believe it or not have not been to this neighborhood location yet! i love the food and atmosphere there - in palm coast, they have live mariachi bands on mondays. do they have that here yet?",
          "i miss good mexican food! will try it",
          "so good",
          "great food and service!",
          "exceptional food and service. excellent salsa and house margaritas.",
          "love the tortilla soup..",
          "they do have excellent food and service + an awesome outdoor dining area",
          "love salsas",
          "love the food not the loud music.",
          "i love the food there but its so loud, the way the room is built, very echo-y.",
          "might try the patio once the temps drop and the skeeters go away. like in december.",
          "love it",
          "i love salsas cocina oviedo! it's one of my favorite places!",
          "not nearly as good as azteca",
          "it always feels like a party!",
          "good food service is hit and miss. don't get me wrong i still go back every time i have an opportunity, i just wish the service was more consistent.",
          "best mexican restaurant ever!!! ",
          "salsas is very good. recently tried las carreras. excellent mole and great salsa bar. both places rank high.",
          "sergio is tops! and awesome margaritas!!!!!",
          "one of my favorite places to go as well!!",
          "we love salsas!!!",
          "love it there too",
          "where is this located? love to try new restaurants.",
          "my favorite mexican restaurant",
          "i love personal recommendations",
          "this place has really great food and service.",
          "the food is worth the 3 hour wait to get it ",
          "my favorite!!!",
          "i may be biased as i used to work there, but i absolutely love this place!! the food is amazing, the staff is great, and it's right here in oviedo. 10/10 would recommend that y'all try it out",
          "i agree!! i love it!!",
          "love that place.",
          "if you can ever get service! manager and multiple employees walked by me waiting to be seated. after 20 mins i left and will not be back.",
          "mmmmmmm tacos",
          "know why this is my favorite mexican restaurant in three states? because the food is authentic and well-made the metal lanterns and decor make me happy and best of all : when my bank statement showed a charge from here taken out two times the manager here worked patiently through pages of reports to find the mistake was not theirs but still offered me a refund on the double charge! how cool is that? i turned around and had lunch there again and told him i'd share this. ",
          "well done, salsas"
)


# sentiment.ai

sentiment.ai.score <- sentiment_score(text)
#if an error persists, go into Tools/Global Options/select Python, then select anaconda Python environment
#run line 140 again.Assuming you're using RStudio, it can be helpful to go to tools > global options > python > python interpreter and set your new tensorflow-ready environment as the default interpreter. There'salso an option for automatically setting project-level environments,

# From Sentiment Analysis
sentimentAnalysis.score <- analyzeSentiment(text)$SentimentQDAP

# From sentimentr
sentimentr.score <- sentiment_by(get_sentences(text), 1:length(text))$ave_sentiment
data.frame(text)

example <- data.frame(target = text, 
                      sentiment.ai = sentiment.ai.score,
                      sentimentAnalysis = sentimentAnalysis.score,
                      sentimentr = sentimentr.score)
print(example)
print(sentiment.ai.score)
sentiment_match(text)

my_positives <- c("favorite", "love", "good", "enjoy")
my_negatives <- c("not", "bad", "loud", "but")

my_categories <- list(positive = my_positives, negative = my_negatives)

result <- sentiment_match(x = text, phrases = my_categories)

print(result)

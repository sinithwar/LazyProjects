=begin

Nicotine = 25mg.ml
Bottle = 30ml
Standard Bottle = 10ml
Desired Amount = 6mg.ml
25mg.ml/10ml = 2.5mg.ml
<not given best result>
2.5 x 3 = 7.5mg.ml = 3ml needed to make one 10ml contain 7.5mg.ml
which means I need 9mg.ml to make a 30ml bottle contain 7.5mg.ml
<better result>
6 / 2.5 = 2.4ml drops
30ml / 10ml = 3 * 2.4ml = End Result of 7.2ml drops

So, what am I doing here? Well, I start by taking the strength of the nicotine and dividing
it by the standard bottle size to get a median of how much nicotine mg per ml I need to fill
a standard bottle.

BaseAmountOfNicotine = Nicotine / StandardBottle

With the amount I recieved from the BAON, I can then divide the desired amount of nicotine by
BAON to get the exact amount I need for the standard bottle.

Nicotine Result = Desired Amount / BAON

Once I find out the Nicotine result of the standard bottle, I then need to divide the size
of the actual bottle by the size of the standard bottle to recieve the MultiplAmount
I need to multipy against the nicotine result to find the actual result.

// Changes - Within the actual code, if a user only has a 10ml bottle, this is a divide by 0
scenario. So, I updated the equation to account for this. Additionally, since it is a pain
to exactly measure the amount inside of a ML extractor, I round the number to get a more
viable result. But I also provide them with the exact number in case they want it.

MultiplAmount = Bottle / Standard Bottle
Final Result = MultpilAmount * Nicotine Result

User inputs
Bottle
Nicotine
Desired Amount

Back Process
Standard Bottle

Equations
var BaseNic = N/SB
var NicPerBot = SB/B
var Result = DA*NicPerBot


=end

puts("What is the size of the bottle that you are using?")
bottle = gets.chomp.to_i
puts("What is the miligram of the Nicotine that you will be using as the additive?")
nicotine = gets.chomp.to_f
puts("What is the Desired Strength of Nicotine that you want inside of your Bottle?")
desiredamount = gets.chomp.to_i
standardbottle = 10
#divyPerBot =

if bottle == 10
	divyPerBot = 1
else
	divyPerBot = bottle / standardbottle
end

baseNic = nicotine / standardbottle # 2.5
desiredNic = desiredamount / baseNic # 2.4
result = divyPerBot * desiredNic # 7.2
roundResult = result.round
endResult = roundResult.to_s

puts("The amount of milliliter drops you will want to use is about " + endResult + " inside of your " + bottle.to_s + "ml bottle.")
puts("However, if you wish to know the exact amount of drops, then it is " + result.to_s + "ml.")

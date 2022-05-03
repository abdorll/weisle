void main() {
    recoredSubjectScoreFunc('FSC 115', 99);
    recoredSubjectScoreFunc('FSC 113', 72);
   }
   recoredSubjectScoreFunc(subject, score){
      SubjectsAndScore subjectsAndScore = SubjectsAndScore();
     subjectsAndScore.subjectName = subject;
     subjectsAndScore.subjectScore = score;
     scoreCheck(subjectsAndScore.subjectName!, subjectsAndScore.subjectScore);
   }
   scoreCheck(subject, score){
     if((score>=80) & (score<100)){
     print('Your grade for $subject is A');
   } else if((score>=60) & (score<=79)){
     print('Your grade for $subject is B');
   }else if((score>=50) & (score<=59)){
     print('Your grade for $subject is C');
   }else if((score>=40) & (score<=49)){
     print('Your grade for $subject is D');
   }else if((score<=39)){
     print('Your grade for $subject is F');
   }
    else if((score>100)){
     print('Your grade for $subject is not valid');
   }
     else{
       print('Your grade for $subject is not found');
     }
   }
   class SubjectsAndScore{
     String? subjectName;
     num? subjectScore;
   }
   
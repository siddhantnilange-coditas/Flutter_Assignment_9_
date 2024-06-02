abstract class InitialLangugageEvent{

}

class SelectedLanguageEvent extends InitialLangugageEvent{
   final int selectedIndex;

   SelectedLanguageEvent(this.selectedIndex);
}



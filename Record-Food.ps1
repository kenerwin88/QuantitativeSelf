function Record-Food($Date, $Name, $Calories, $Fat, $Carbs, $Protein) {
    Record-Data -Date $Date `
                -Name 'Food' `
                -Data @{Name = $Name;
                        Calories = $Calories;
                        Fat = $Fat;
                        Carbs = $Carbs
                        Protein = $Protein}
}
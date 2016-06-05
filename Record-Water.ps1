function Record-Water($Date, $Ounces) {
    Record-Data -Date $Date `
                -Name 'Water' `
                -Data @{Ounces = $Ounces}
}
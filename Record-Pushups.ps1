function Record-Pushups($Date, $Pushups) {
    Record-Data -Date $Date `
                -Name 'Pushups' `
                -Data @{Pushups = $Pushups}
}
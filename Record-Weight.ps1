function Record-Weight($Date, $Weight) {
    Record-Data -Date $Date `
                -Name 'Weight' `
                -Data @{Weight = $Weight}
}
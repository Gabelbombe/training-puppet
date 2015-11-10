class ordering::epel {
  yumrepo { 'epel':
    enabled => present,
  }

  Package <| |> {
    require => Yumrepo['epel']
  }

  #works the same, diff syntax...
  #Yumrepo['epel'] -> Package <| |>
}
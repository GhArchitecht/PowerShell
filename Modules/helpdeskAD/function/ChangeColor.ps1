filter ChangeColor {

   $yellow = "$([char]0x1b)[91m"
   $reset = "$([char]0x1b)[m"


   if (($_ -eq "Yes")-or($_ -eq "Account expired ")  )
   {
    $_ = "${yellow}$_${reset}"
   }
   return $_
   else{

    return "$_(${reset})"
   }
  
}

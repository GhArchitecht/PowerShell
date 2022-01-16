    filter BoolToYesNo {
        if($_ -is [bool]){
          $_ = @('No','Yes')[$_]
        }
        return $_

        else {
        return 'No  info'
      }
    }

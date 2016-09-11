// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require_self

$('#game-form form').ready(function() {
checkOptions();
});

function checkOptions() {
  $('.team-group select').change(function(event) {

    event.preventDefault();
    var clicked_selector = $($(this)[0]).attr('id')
    var clicked_team = $(this).val()
    var form_data = $(this).serialize()

    $.ajax({
      url: $('#game-form form').attr('action') + '/new',
      method: 'GET',
      data: form_data
    })

    .done(function(serverData) {
        var user_team = serverData[0]
        var selector_team_options = $('.team-group select')

        var $dropdown1 = $("select[name='game[home_team]']");
        var $dropdown2 = $("select[name='game[away_team]']");

        console.log($dropdown2)

        $dropdown1.change(function() {
          $dropdown2.find('option').prop("disabled", false);
          var selectedItem = $(this).val();
          console.log(selectedItem)
          if (selectedItem) {
            $dropdown2.find('option[value="' + selectedItem + '"]').prop("disabled", true);
          }
        });

        for (var opt, i = 0; opt = selector_team_options[i]; i++) {
          var selector_option = $($(opt)[0]).attr('id')
          if (clicked_selector == selector_option) {
            (selector_team_options.splice(i, 1))
            var other_team = $(selector_team_options[0])
            if (clicked_team != user_team) {
              other_team.val(user_team)
            }
            // else {
            //   teams = selector_team_options.children()
            //   for (var team, j = 0; team = teams[j]; j++) {
            //     if ($(team).attr('value') == user_team ) {
            //       console.log('yes')
            //       $(this).remove()


            //     }
            //   }

            // }
          }
        }
    })
  })
}

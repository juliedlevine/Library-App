$(document).ready(function() {

    // Search results - will show 1 book, that cover and author will be added
    $("#name").on('keyup', function(event) {
        event.preventDefault();
        var search_term = $("#name").val();
        var url =
        "https://www.goodreads.com/search/index.xml?key=GjaJx7mGjlPyfDWmciekoA&Vary=*&q=" + search_term;
        $.ajax({
            method: 'POST',
            url: url,
            dataType: 'xml'
        })
        .then(function(data) {
            var search = $(data).find('search').find('results').find('work').find('best_book');
            var title = $(search).find('title').first().text();
            var author = $(search).find('author').find('name').first().text();
            var cover = $(search).find('image_url').first().text();
            $('.search_cover').attr('src', cover);
            $('.search_title').text(title);
            $('.search_author').text(author);
        })
        .catch(function(err) {
            console.log(err.message);
        });
    }); //end keyup


    // Submit button click. Will not submit unless all fields are filled out
    $('.save_book').click(function() {
        var title = $('#name').val();
        var author = $('.search_author').text();
        var description = $('.description').val();
        var cover = $('.search_cover').attr('src');

        if (title === '' || description === '') {
            alert("Fill out both fields!");
        }
        else {
            $.ajax({
                method: 'POST',
                url: '/save_book',
                data: {
                    title: title,
                    author: author,
                    cover: cover,
                    description: description
                }
            })
            .then(function(response) {
                window.location.href = '/';
            });
        }
    });

});

modules = {
    application {
        resource url: 'js/application.js'
    }
    'tablesorter-css' {
        resource url: [dir: 'css', file: 'tablesorter.css', disposition: 'head', exclude: 'minify']

    }
    tablesorter {
        resource url: 'js/jquery.tablesorter.js'
        dependsOn 'tablesorter-css'
    }
    'ckeditor-adaptor' {
        resource url: 'ckeditor/adapters/jquery.js'
        dependsOn 'ckeditor'
    }
    'ckeditor' {
        resource url: 'ckeditor/ckeditor.js'
    }
}
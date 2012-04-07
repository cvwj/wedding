package wedding2

class Guest {

    String name
    String language
    String relation
    String address
    String phone
    String email

    static constraints = {
        email(nullable: true)
        phone(nullable: true)
        address(nullable: true)
    }
}

@wip
Feature: Price plans that have a discount based on usage 
    Energy switchers want to see the cheapest energy tarrifs based on their usage

    Scenario: Find the cheapest energy plans when usage low
        Given plans with discounts
        When annual usage is 1000 kwh
        Then the cheapest plans are
        | supplier | plan name          | price  |
        | edf      | fixed              | 100.75 |
        | eon      | variable           | 103.43 |
        | ovo      | standard           | 109.73 |
        | bg       | standing-charge    | 116.08 |

    Scenario: Find the cheapest energy plans when usage high
        Given plans with discounts 
        When annual usage is 2000 kwh
        Then the cheapest plans are
        | supplier | plan name          | price  |
        | edf      | fixed              | 195.25 |
        | eon      | variable           | 208.43 |
        | bg       | standing-charge    | 210.58 |
        | ovo      | standard           | 225.23 |


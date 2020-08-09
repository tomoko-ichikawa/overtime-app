# Overtime App

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models
- x Post -> date:date rationale:text
- x User -> Devise
- x AdminUser -> STI
- Auditlog

## Features:
- Approval workflow
- SMS　Sending -> link to approval or vertime input
- x Administrate admin dashboard
- x Block non admin dashboard
- Email summary to managers for approval
- Needs to be documented it employee did not log overtime

## UI:
- x Bootstrap -> formatting
- x Icons from Font glyphicons
- x Update the styles for forms

## Refactor TODOS:
- x Add full_name method for users
- x Refactor user association integration test in post_spec
- x Refactor posts/_form for admin user with status
- x Fix post_spec.rb:81 to use factories
- x Fix post_spec.rb:51 to have correct user reference and not require updates

## TODOS:
- Integrate validation for phone attr in User:
  # no spaces or dashes
  # exactly 10 characters
  # all characters have to be a number
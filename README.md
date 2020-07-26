# Overtime App

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models
- x Post -> date:date rationale:text
- x User -> Devise
- x AdminUser -> STI

## Features:
- Approval workflow
- SMS　Sending -> link to approval or vertime input
- Administrate admin dashboard
- Email summary to managers for approval
- Needs to be documented it employee did not log overtime

## UI:
- x Bootstrap -> formatting

## Refactor TODOS:
- x Add full_name method for users
- Refactor user association integration test in post_spec
___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Labelium - User-Provided Data (Unified for CAPIs)",
  "description": "Unified variable for User-Provided Data, Enhanced Conversion and CAPIs.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "email_section",
    "displayName": "Email Address",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "email",
        "displayName": "Email",
        "simpleValueType": true,
        "help": "Provide email addresses in a standard format (e.g., example@domain.com), converted to lowercase, with any extra spaces removed. Before sending, the email should be securely hashed using the SHA-256 algorithm to ensure data privacy, if you don\u0027t have the email hashed, select the following checkbox.",
        "valueHint": "example@domain.com",
        "alwaysInSummary": true
      },
      {
        "type": "CHECKBOX",
        "name": "opt_email",
        "checkboxText": "Data is already in SHA256",
        "simpleValueType": true,
        "help": "Hashing data using the SHA-256 algorithm ensure data privacy",
        "alwaysInSummary": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "phone_section",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "phone",
        "displayName": "Phone",
        "simpleValueType": true,
        "help": "Provide phone numbers in a standard international format (e.g., 1234567890), with country codes included, any spaces, dashes, or special characters removed. The phone number should be securely hashed using the SHA-256 algorithm before being sent to ensure privacy, if you don\u0027t have the email hashed, select the following checkbox.",
        "valueHint": "1234567890",
        "alwaysInSummary": true
      },
      {
        "type": "CHECKBOX",
        "name": "opt_phone",
        "checkboxText": "Data is already in SHA256",
        "simpleValueType": true,
        "help": "Hashing data using the SHA-256 algorithm ensure data privacy",
        "alwaysInSummary": true
      }
    ],
    "displayName": "Phone Number"
  },
  {
    "type": "GROUP",
    "name": "user_id_section",
    "displayName": "User ID",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "user_id",
        "displayName": "User ID",
        "simpleValueType": true,
        "help": "Provide user IDs as unique, consistent identifiers associated with individual users."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "user_info",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "first_name",
        "displayName": "First Name",
        "simpleValueType": true,
        "help": "Provide first names in a standardized format, with all characters converted to lowercase and any extra spaces or special characters removed.",
        "valueHint": "John"
      },
      {
        "type": "CHECKBOX",
        "name": "opt_first_name",
        "checkboxText": "Data is already in SHA256",
        "simpleValueType": true,
        "help": "Hashing data using the SHA-256 algorithm ensure data privacy"
      },
      {
        "type": "TEXT",
        "name": "last_name",
        "displayName": "Last Name",
        "simpleValueType": true,
        "help": "Provide last names in a standardized format, with all characters converted to lowercase and any extra spaces or special characters removed.",
        "valueHint": "Doe"
      },
      {
        "type": "CHECKBOX",
        "name": "opt_last_name",
        "checkboxText": "Data is already in SHA256",
        "simpleValueType": true,
        "help": "Hashing data using the SHA-256 algorithm ensure data privacy"
      },
      {
        "type": "TEXT",
        "name": "street_address",
        "displayName": "Street Address",
        "simpleValueType": true,
        "valueHint": "123 New Rd"
      },
      {
        "type": "TEXT",
        "name": "city",
        "displayName": "City",
        "simpleValueType": true,
        "valueHint": "Southampton"
      },
      {
        "type": "TEXT",
        "name": "region",
        "displayName": "Region",
        "simpleValueType": true,
        "valueHint": "ca",
        "help": "Two-letter lowercase state, province or department code"
      },
      {
        "type": "TEXT",
        "name": "postal_code",
        "displayName": "Postal Code",
        "simpleValueType": true,
        "valueHint": "SO99 9XX"
      },
      {
        "type": "TEXT",
        "name": "country",
        "displayName": "Country",
        "simpleValueType": true,
        "valueHint": "uk",
        "help": "Use 2-letter country codes"
      }
    ],
    "displayName": "User Adress"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

function userData(email, opt_email, phone, opt_phone, user_id, first_name, opt_first_name, last_name, opt_last_name, street_address, city, region, postal_code, country) {
  var userdata = {};
  userdata.address = {};
  
  //Condition if email is defined
  if (email) {
    userdata.em = email;
    //Condition if email is sent via sha256
    userdata[opt_email ? 'sha256_email_address' : 'email'] = email;
  }

  //Condition if phone is defined
  if (phone) {
    //Condition if phone is sent via sha256
    if (opt_phone) {
      userdata.sha256_phone_number = phone;
      userdata.ph = phone;
    } else {
      if (phone.indexOf('+') !== 0) {
        userdata.phone_number = '+' + phone;
        userdata.ph = phone;
      } else{
        userdata.phone_number = phone;
        userdata.ph = phone.slice(1);
      }
    }
  }

  //Condition if user_id is defined
  if (user_id) userdata.external_id = user_id;

  //Condition if first name is defined 
  if (first_name) {
    userdata.fn = first_name;
    //Condition if first name is sent via sha256
    userdata.address[opt_first_name ? 'sha256_first_name' : 'first_name'] = first_name;
  }

  //Condition if last name is defined
  if (last_name) {
    userdata.ln = last_name;
    //Condition if last name is sent via sha256
    userdata.address[opt_last_name ? 'sha256_last_name' : 'last_name'] = last_name;
  }

  //Condition if street address is defined
  if (street_address) userdata.address.street = street_address;
  
  //Condition if city is defined
  if (city) {
    userdata.address.city = city;
    userdata.ct = city;
  }
  
  //Condition if region is defined
  if (region) {
    userdata.address.region = region;
    userdata.st = region;
  }
  
  //Condition if postal code is defined
  if (postal_code) {
    userdata.address.postal_code = postal_code;
    userdata.zp = postal_code;
  }
  
  //Condition if country is defined
  if (country) {
    userdata.address.country = country;
    userdata.country = country;
  }

  return userdata;
}

var user_data = userData(data.email, data.opt_email, data.phone, data.opt_phone, data.user_id, data.first_name, data.opt_first_name, data.last_name, data.opt_last_name, data.street_address, data.city, data.region, data.postal_code, data.country);

return user_data;


___TESTS___

scenarios:
- name: Untitled test 1
  code: |-
    const mockData = {
      hashed_used_phone : "0123456789"
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo(undefined);


___NOTES___

Created on 15/11/2024, 14:27



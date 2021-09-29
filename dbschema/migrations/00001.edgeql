CREATE MIGRATION m17rwb4qne7ppqsolce64ic3xmz4gy3i2645k3kmbrujvi3ehgyz7a
    ONTO initial
{
  CREATE TYPE default::Profile;
  CREATE TYPE default::User {
      CREATE REQUIRED SINGLE LINK profile -> default::Profile;
  };
  ALTER TYPE default::Profile {
      CREATE REQUIRED LINK user := (std::assert_exists((SELECT
          .<profile[IS default::User]
      )));
  };
};

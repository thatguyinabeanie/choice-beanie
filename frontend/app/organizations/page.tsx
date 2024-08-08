import React from "react";
import { Link } from "@nextui-org/link";

import { title } from "@/components/primitives";
import { OrganizationsApi } from "@/api";
import OrganizationCard from "@/components/organizations/OrganizationCard";

export default async function OrganizationsPage() {
  const orgsApi = new OrganizationsApi();

  const organizations = (await orgsApi.listOrganizations()).data;

  return (
    <div>
      <h1 className={title()}>Organizations</h1>
      <div className="container relative flex flex-row m-4 p-5 justify-evenly">
        {organizations.map((organization) => (
          <Link
            key={organization.id}
            href={`/organizations/${organization.id}`}
          >
            <OrganizationCard
              key={organization.id}
              organization={organization}
            />
          </Link>
        ))}
      </div>
    </div>
  );
}

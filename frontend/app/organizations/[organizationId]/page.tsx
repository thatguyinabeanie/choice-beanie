// organizations/[organizationId]/page.tsx
"use client";

import { useEffect, useState } from "react";
import { useParams } from "next/navigation";

import { OrganizationsApi } from "@/api/api";
import { Organization } from "@/api";
import OrganizationCard from "@/components/organizations/OrganizationCard";

const OrganizationDetailsPage = () => {
  const { organizationId } = useParams();

  const [organization, setOrganization] = useState<Organization | null>(null);

  useEffect(() => {
    if (organizationId) {
      const fetchOrganizationDetails = async () => {
        const orgsApi = new OrganizationsApi();
        const request = { id: organizationId as string };

        const org = (await orgsApi.getOrganization(request)).data;

        setOrganization(org);
      };

      fetchOrganizationDetails();
    }
  }, [organizationId]);

  if (!organization) {
    return <p>Loading...</p>;
  }

  return (
    <div>
      <OrganizationCard organization={organization} />
    </div>
  );
};

export default OrganizationDetailsPage;

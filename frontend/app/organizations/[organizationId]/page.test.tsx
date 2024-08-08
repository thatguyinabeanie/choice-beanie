import { render, screen, waitFor } from "@testing-library/react";

import OrganizationDetailsPage from "./page";

import { OrganizationsApi } from "@/api/api";

jest.mock("@/api/api");

describe("OrganizationDetailsPage", () => {
  it("renders loading message when organization is null", () => {
    render(<OrganizationDetailsPage />);
    expect(screen.getByText("Loading...")).toBeInTheDocument();
  });

  it("renders organization details when organization is fetched", async () => {
    const mockOrganization = {
      id: "1",
      name: "Example Organization",
      // Add other properties as needed
    };

    OrganizationsApi.prototype.getOrganization.mockResolvedValueOnce({
      data: mockOrganization,
    });

    render(<OrganizationDetailsPage />);

    await waitFor(() => {
      expect(screen.getByText(mockOrganization.name)).toBeInTheDocument();
      // Add assertions for other organization details
    });
  });
});

import streamlit as st
import pandas as pd

st.set_page_config(page_title="AgroLink", layout="centered")

st.title("🌱 AgroLink – Cameroon AgriTech Hub")
st.markdown("Connect farmers, buyers, and experts with ease.")

if 'products' not in st.session_state:
    st.session_state['products'] = []

st.subheader("📦 Add a New Product Listing")

with st.form("product_form"):
    name = st.text_input("Product Name")
    price = st.number_input("Price (in FCFA)", min_value=0.0, format="%.2f")
    quantity = st.text_input("Quantity (e.g., 50kg, 3 crates)")
    location = st.text_input("Farmer Location")
    submit = st.form_submit_button("Add Listing")

    if submit and name and quantity and location:
        st.session_state.products.append({
            "Product": name,
            "Price (FCFA)": price,
            "Quantity": quantity,
            "Location": location
        })
        st.success("✅ Product added successfully!")

if st.session_state.products:
    st.subheader("📋 Current Listings")
    st.dataframe(pd.DataFrame(st.session_state.products))
else:
    st.info("No products listed yet. Add some above.")

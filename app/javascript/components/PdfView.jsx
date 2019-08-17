import React from 'react'
import { Document, Page } from 'react-pdf/dist/entry.webpack'

export default class PdfView extends React.Component {
    render() {
        return (
            <Document file="/assets/resume.pdf">
                <Page pageNumber={1} scale={2} />
            </Document>
        )
    }
}